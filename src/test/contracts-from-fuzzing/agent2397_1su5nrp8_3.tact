struct Level3 { a: Int; b: Bool; c: String; }

struct Level2 { foo: Level3; bar: Level3; }

struct Level1 { inner1: Level2; inner2: Level2; }

contract MultiNested {
    deep: Level1 = Level1{
        inner1: Level2{ foo: Level3{a:1,b:true,c:""}, bar: Level3{a:2,b:false,c:"hi"} },
        inner2: Level2{ foo: Level3{a:3,b:true,c:"bye"}, bar: Level3{a:4,b:false,c:"ok"} }
    };
    receive() {}
}