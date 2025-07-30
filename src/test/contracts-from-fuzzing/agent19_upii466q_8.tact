contract TestAdd {
    const VAL: Int = 10;
    computed: Int = self.VAL + 5;

    receive() {}
}
