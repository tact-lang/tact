struct Level1 { a: Int; b: Int; }

struct Level2 { 
    l1: Level1; 
    maybe: Level1?; 
    mapField: map<Int, Level1>;
}

struct Level3 { 
    l2: Level2; 
    extra: Int;
}

contract TestNested {
    receive() {
       let inst: Level3 = Level3 {
           l2: Level2 {
               l1: Level1 { a: 10, b: 20 },
               maybe: Level1 { a: 30, b: 40 },
               mapField: emptyMap()
           },
           extra: 50
       };
       
       inst.l2.mapField.set(1, Level1 { a: 70, b: 80 });
       dump(inst.l2.l1.a);
       dump(inst.l2.maybe!!.b);
       let m: Level1 = inst.l2.mapField.get(1)!!;
       dump(m.a);
       dump(inst.extra);
    }
}
