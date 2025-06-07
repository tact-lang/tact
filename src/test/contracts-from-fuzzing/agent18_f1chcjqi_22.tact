struct Mix {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
}

struct OuterMix {
    nestedA: Mix;
    nestedB: Mix;
}

contract MixNested {
    data: OuterMix;
    init() {
        self.data = OuterMix{
            nestedA: Mix{intVal:1,boolVal:true,stringVal:"a"},
            nestedB: Mix{intVal:2,boolVal:false,stringVal:"b"}
        };
    }
}