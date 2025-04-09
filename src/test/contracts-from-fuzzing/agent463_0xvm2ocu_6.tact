struct Mid {
    intVal: Int;
    strVal: String;
    optVal: Bool?;
}

struct Outer {
    one: Mid;
    two: Mid;
    three: Mid;
}

contract StructsInStructTest {
    payload: Outer;
    init() {
        self.payload = Outer{
            one: Mid{intVal:1,strVal:"a",optVal:true},
            two: Mid{intVal:2,strVal:"b",optVal:false},
            three: Mid{intVal:3,strVal:"c",optVal:null}
        };
    }
}
