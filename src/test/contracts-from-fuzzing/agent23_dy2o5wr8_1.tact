contract MyContract {
    fun showcase() {
        let result = false ? 1 : true ? 2 : 3;
        dump(result);
    }
}
