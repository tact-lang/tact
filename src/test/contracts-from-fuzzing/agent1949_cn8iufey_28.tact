struct DeepStr1 { x: Int; }
struct DeepStr2 { a: DeepStr1; }
struct DeepStr3 { a: DeepStr2; }
struct DeepStr4 { a: DeepStr3; }
struct DeepStr5 { a: DeepStr4; }

contract VeryDeepStruct {
    val: DeepStr5?;

    init() {
        self.val = null;
    }
}
