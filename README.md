# Sin Tax README

## About
This is a plugin for making it easier to type syntactiacal things such as creation and deletion of brackets and quotes as well as commenting. Perhaps later in the future I will add things for html aswell.

## Install
Currently the only way of installing is by putting plugin file in your vim plugin folder. To download the plugin folder symply git clone it.

## Use 

### Terms
when reffering to the rapper I mean the two charicter string surrounding the cursor(It cannot be longer or shorter than two charicters) the rapper can be pretty much any two charecters you desire just keep in mind that the first charicter will allways be used as the insert mode key mapping so if you use this -> "hf" as a rapper then every time you want to type hallo you will get hfallo or any time you want to type the letter "h" in genral.

### Commands
It is very simple there are only three commands:

`SetRappers`<br>
Set list of wanted Rappers this will delete the default list of Rappers. Recieves multiple arguments each being a rapper you want seperated by spaces e.g SetRapper () [] \*\*.

`AddRapper`<br>
Adds a new Rapper for the current session. Recieves one argument being the rapper you want added e.g AddRapper {} , If multipal arguments are given an error is thrown.

`ListRappers`<br>
Lists out all the rappers you have got. recieves no arguments, if argument is given an error is thrown.

`RemoveRapper`<br>
Removes a rapper from the list in the current session. Recieves one argument that being the rapper you want to remove e.g RemoveRapper \*\*. If more aruments are given an error will be thrown.

The key mappings are always Updated when using one of these commands(except ListRappers).


