struct Embed {
    sub1: Int;
    sub2: Bool;
}

contract LotsOfEmbed {
    data1: Embed;
    data2: Embed;
    data3: Embed;
    data4: Embed;

    init() {
        self.data1 = Embed{ sub1:1, sub2:true };
        self.data2 = Embed{ sub1:2, sub2:false };
        self.data3 = Embed{ sub1:3, sub2:true };
        self.data4 = Embed{ sub1:4, sub2:false };
    }
}