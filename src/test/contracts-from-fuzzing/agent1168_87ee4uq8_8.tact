struct S { x: Int; y: Bool; z: String; }

contract FieldOrder {
    third: Bool;
    first: Int;
    second: String;
    nested: S;

    init() {
        self.third = true;
        self.first = 1;
        self.second = "hi";
        self.nested = S { x: 5, y: false, z: "zzz" };
    }
}