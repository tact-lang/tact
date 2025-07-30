struct Inner { x: Int; }
struct Wrapper { inner: Inner?; }

contract MultiOpt {
    wrapperOpt: Wrapper?;
}
