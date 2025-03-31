contract Test {
    receive() {}

    // Getter attempting to return a Builder type
    get fun getBuilder(): Builder {
         let b: Builder = beginCell();
         return b;
    }
}
