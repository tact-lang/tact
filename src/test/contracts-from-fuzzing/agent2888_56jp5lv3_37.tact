// optional struct inside param chain, but nested inside another struct
struct InnerMost {
    flag: Bool?;
}

struct Middle {
    inner: InnerMost?;
}

contract ParamNest(
    m: Middle?,
) {
    receive() {
        let _ = self.m;
    }
}