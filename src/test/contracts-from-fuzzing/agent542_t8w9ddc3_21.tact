struct InnerP {
    x: Int;
    y: Bool?;
}

contract ParamNested(
    nested: InnerP?,
    flag: Bool
) {
    receive() {
        // dummy to force contract usage
        dump(self.flag);
    }
}