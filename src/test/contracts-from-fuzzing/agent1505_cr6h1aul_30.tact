struct DeepOpts1 { a:Int?; }
struct DeepOpts2 { b:DeepOpts1?; }
struct DeepOpts3 { c:DeepOpts2?; }

contract MoreOpts {
    s: DeepOpts3?;
    init() {
        self.s = null;
    }
}