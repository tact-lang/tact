contract TestAugmentedBool {
    receive() {
        let flag: Bool = false;
        flag &&= true;
        dump(flag);
    }
}
