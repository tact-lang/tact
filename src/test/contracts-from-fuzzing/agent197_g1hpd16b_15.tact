struct StrStruct {
    a: String = "";
    b: String = "A";
    c: String = "Test";
    d: String = "🧪";
}

contract StrStorage {
    s: StrStruct = StrStruct{ a: "", b: "A", c: "Test", d: "🧪" };
}