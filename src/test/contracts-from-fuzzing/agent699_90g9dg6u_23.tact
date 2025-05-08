struct Spam { a:Int; b:Bool; c:String; d:Int?; e:Bool?; f:String?; }

contract MixedCombo {
    s: Spam;

    init() {
        self.s = Spam{
            a: 101,
            b: true,
            c: "hi",
            d: null,
            e: false,
            f: null
        };
    }
}