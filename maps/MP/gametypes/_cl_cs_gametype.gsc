main() {

    precacheMenu("buyMenu");
    precacheMenu("pistolMenu");
    precacheMenu("rifleMenu");
    precacheMenu("automaticMenu");

    level thread onPlayerSpawned();
}

onPlayerSpawned() {
    for(;;) {
        level waittill("spawned_player", player);
        player thread player_spawned();
    }
}

player_spawned() {
    self.money = 800;
    self
    thread openBuyMenu();
}

openBuyMenu() {
    self endon("disconnect");
    for (;;) {
        self waittill("round_start");
        self openMenu("buyMenu");
    }
}

openSubMenu(menuName)
        {
                self openMenu(menuName);
        }

buyWeapon(weaponName, cost)
{
if(self.money >= cost)
{
    self.money -=
    cost;
    self giveWeapon(weaponName);
    self iprintln("Vous avez acheté un(e) " + weaponName + " pour " + cost + "$");

    self closeAllMenus();
}
else
{
self iprintln("Vous n'avez pas assez d'argent pour acheter un(e) " + weaponName);
}
}

giveWeapon(weaponName)
        {
        self takeAllWeapons();
        self giveWeapon(weaponName, 1);
        self switchToWeapon(weaponName);
        }


closeAllMenus() {
    self closeMenu("buyMenu");
    self closeMenu("pistolMenu");
    self closeMenu("rifleMenu");
    self closeMenu("automaticMenu");
}
