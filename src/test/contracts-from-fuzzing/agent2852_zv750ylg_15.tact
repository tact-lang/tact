struct Embed1 { f:Int; }
struct Embed2 { e:Embed1; }
struct Embed3 { d:Embed2; }

contract MultiEmbed {
    z: Embed3;

    init() {
        self.z = Embed3{ d: Embed2{ e: Embed1{ f: 7 } } };
    }
}