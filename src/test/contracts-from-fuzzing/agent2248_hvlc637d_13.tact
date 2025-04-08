struct Embed1 {
    aa: Int;
    ab: String;
}

struct Embed2 {
    ba: Embed1;
    bb: String;
}

contract RecursiveEmbed {
    r: Embed2;

    init() {
        self.r = Embed2{
            ba: Embed1{aa:1, ab:"xx"},
            bb: "yy"
        };
    }
}