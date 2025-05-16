struct Child {
    weight: Int?;
}

contract DefaultDeepNulls {
    child: Child?;

    init() {
        // no explicit initialization
    }
}