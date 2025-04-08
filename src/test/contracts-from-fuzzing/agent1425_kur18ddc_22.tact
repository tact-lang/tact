struct Banner { msg: String = "hello world"; }

contract Test {
    banner: Banner;
    init() { self.banner = Banner{}; }
    receive() {}
}