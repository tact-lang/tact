struct NestedPrimitives {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
}

contract TestNestedPrims {
    data: NestedPrimitives;

    init() {
        self.data = NestedPrimitives {
            level1: Level1 {
                level2: Level2 {
                    intVal: 7, boolVal: true, stringVal: "str"
                }
            }
        };
    }
}
