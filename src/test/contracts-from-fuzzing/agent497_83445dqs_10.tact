struct Embed {
    x: Int;
    y: Bool;
    s: String;
}

contract MultiEmbed {
    e1: Embed;
    e2: Embed;
    e3: Embed;

    init() {
        self.e1 = Embed{x:1,y:true,s:"A"};
        self.e2 = Embed{x:2,y:false,s:"B"};
        self.e3 = Embed{x:3,y:true,s:"C"};
    }
}