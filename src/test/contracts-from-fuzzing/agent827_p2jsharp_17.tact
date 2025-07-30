struct DeepOpt {
    info: String?;
    num: Int?;
}

contract ChainOptional {
    value: DeepOpt? = null;

    receive() {
        self.value = DeepOpt{ info: null, num: null };
    }
}