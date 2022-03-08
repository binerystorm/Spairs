# S-pairs

## Description
Spairs (simple-pairs) is a pretty simple plugin for dealing with the automatic opening and closing of brackets and quotes. It is relativly dinamic so you can use it with more than just quotes and brackets

## Install
It is compatible with vim-plug and probably most other plugin managers. If it doesnt work you could always paste the files into the apropriat places in your vim directory but that is not preferable as its a pain to maintain and you may not know how to do that

## Use 

### Terms
when reffering to the rapper I mean the two charicter string surrounding the cursor(It cannot be longer or shorter than two charicters) the rapper can be pretty much any two charecters you desire just keep in mind that the first charicter will allways be used as the insert mode key mapping so if you use this -> "hf" as a rapper then every time you want to type hallo you will get hfallo or any time you want to type the letter "h" in genral.

### Commands
It is very simple there are only three commands:

  1. `SetRappers`<br>
  Set list of wanted Rappers this will delete the default list of Rappers. Recieves multiple arguments each being a rapper you want seperated by spaces e.g `SetRapper () [] \*\*`.

  1. `AddRapper`<br>
  Adds a new Rapper for the current session. Recieves one argument being the rapper you want added e.g `AddRapper {}` , If multipal arguments are given an error is thrown.

  1. `ListRappers`<br>
  Lists out all the rappers you have got. recieves no arguments, if argument is given an error is thrown.

  1. `RemoveRapper`<br>
  Removes a rapper from the list in the current session. Recieves one argument that being the rapper you want to remove e.g `RemoveRapper \*\*`. If more aruments are given an error will be thrown.

The key mappings are always Updated when using one of these commands (except ListRappers).


