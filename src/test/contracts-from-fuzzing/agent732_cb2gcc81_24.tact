struct InnerStrOpt {
    val: String?;
}

contract InsideOptional {
    inside: InnerStrOpt?;

    init() {
        self.inside = InnerStrOpt{
            val: null
        };
    }
}