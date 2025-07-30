struct InnerMost { val: Int?; }
struct Inner { im: InnerMost?; }

contract OptDeepOpt {
    s: Inner?;
}