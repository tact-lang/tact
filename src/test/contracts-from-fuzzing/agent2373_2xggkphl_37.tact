struct MultiLayer {
    inner1: Int;
    inner2: Bool;
    inner3: String;
}

struct Wrapping {
    deep: MultiLayer;
    text: String;
}

contract StructInStructFields {
    data: Wrapping;

    init() {
        self.data = Wrapping{ deep: MultiLayer{ inner1:5, inner2:true, inner3:"x" }, text: "y" };
    }
}