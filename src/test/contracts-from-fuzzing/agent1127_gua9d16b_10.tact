struct InLine {
    a: Int; b: Bool; c: String; d: Int?; e: Bool?;
}

contract InlineContract {
    rec: InLine;

    init() {
        self.rec = InLine{
            a: 10, b:true, c:"hi", d:null, e:false
        };
    }
}