struct EmptyDefaultOpt {
    opt1: Int?;
    opt2: String?;
}

contract EmptyDefaultOptContract {
    x: EmptyDefaultOpt = EmptyDefaultOpt{};
}