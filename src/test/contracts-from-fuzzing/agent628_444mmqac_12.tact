struct MultiType {
    i: Int;
    b: Bool;
    s: String;
}

contract MixedTypes {
    val: MultiType;

    init() {
        self.val = MultiType{ i:42, b:true, s:"wow" };
    }
}