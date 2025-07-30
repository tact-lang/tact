struct OptDeep1 {
    n: Int?;
}
struct OptDeep2 {
    inner: OptDeep1?;
}
struct OptDeep3 {
    inner: OptDeep2?;
}

contract DeepOptionals {
    data: OptDeep3;

    init() {
        self.data = OptDeep3{ inner: OptDeep2{ inner: OptDeep1{ n: null }}};
    }
}