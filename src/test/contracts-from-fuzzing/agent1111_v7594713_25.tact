// now test an optional of struct with optional
struct Inner {
    x: Int?;
}
struct Outer {
    inner: Inner?;
}
contract OptionalInOptional {
    o: Outer?;
    init() {
        self.o=Outer{inner:Inner{x:null}};
    }
}