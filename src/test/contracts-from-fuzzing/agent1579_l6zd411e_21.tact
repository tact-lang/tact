struct AA { a: Int; }
struct BB { b: Bool; }
struct CC { c: String; }

contract MixedStructs {
    val1: AA;
    val2: BB;
    val3: CC;

    init() {
        self.val1 = AA{a:1};
        self.val2 = BB{b:true};
        self.val3 = CC{c:"hi"};
    }
    receive() {
        self.val1.a += 1;
    }
}