struct Bottom {
    x: Int?;
}

struct Middle {
    child: Bottom?;
}

contract OptChain {
    link: Middle?;
    init() {
        self.link = null;
    }
}