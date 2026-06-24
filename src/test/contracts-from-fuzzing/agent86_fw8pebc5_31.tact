// optional struct inside optional struct inside contract
struct Inner { a: Int; }
struct Middle { inner: Inner?; }

contract C {
    m: Middle?;

    init() {
        self.m = null;
    }
}