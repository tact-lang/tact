struct One { x: Int }
struct Two { y: Bool }
struct Three {
    o: One;
    t: Two?;
}
struct Four {
    th: Three;
    txt: String;
    flag: Bool?;
}

contract TestContract {
    container: Four;

    init() {
        self.container = Four{
            th:Three{
                o:One{x:11},
                t:null
            },
            txt:"hello",
            flag:true
        };
    }
}