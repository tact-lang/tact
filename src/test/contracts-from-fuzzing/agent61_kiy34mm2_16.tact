contract TestNestedTernary {
    receive() {
        let a: Int = false ? 10 : 20;
        let b: Int = true ? (false ? 100 : 200) : 300;
    }
}
