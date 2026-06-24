struct ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
}

contract TestContract {
    pv1: ManyPrimitives;
    pv2: ManyPrimitives;

    init() {
        self.pv1 = ManyPrimitives{
            intVal: 10,
            boolVal: true,
            strVal: "ten"
        };
        self.pv2 = ManyPrimitives{
            intVal: 20,
            boolVal: false,
            strVal: "twenty"
        };
    }
}