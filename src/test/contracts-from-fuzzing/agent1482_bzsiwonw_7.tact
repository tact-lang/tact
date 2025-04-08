// Optional of a struct containing optionals
struct InnerOpt {
    x: Int?;
    y: String?;
}

contract TestContract {
    maybe: InnerOpt?;

    init() {
        self.maybe = null;
    }
}