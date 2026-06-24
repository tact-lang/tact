struct NestOptional {
    val: Int?;
}

contract TopOpt {
    maybe: NestOptional?;

    init() {
        self.maybe = null;
    }
}
