struct Valkyrie { sword:Bool; hair:String }

contract Odin {
    s1:Valkyrie;
    s2:Valkyrie?;
    alive:Bool;

    init() {
        self.s1 = Valkyrie{ sword:true, hair:"blonde" };
        self.s2 = null;
        self.alive = true;
    }
}