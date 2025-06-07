struct Config {
    optionA: Bool;
    optionB: Bool?;
    optionC: Int?;
}

contract TestContract {
    cfg: Config = Config{ optionA: true, optionB:null, optionC:null };
}