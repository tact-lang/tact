struct Ints { a:Int; b:Int; c:Int; d:Int; e:Int; f:Int; g:Int; h:Int; }
struct Bools { a:Bool; b:Bool; c:Bool; d:Bool; e:Bool; f:Bool; g:Bool; h:Bool; }

contract ManyStructsWide {
    si: Ints;
    sb: Bools;

    init() {
        self.si = Ints{ a:1, b:2, c:3, d:4, e:5, f:6, g:7, h:8 };
        self.sb = Bools{ a:true, b:false, c:true, d:false, e:true, f:false, g:true, h:false };
    }
}