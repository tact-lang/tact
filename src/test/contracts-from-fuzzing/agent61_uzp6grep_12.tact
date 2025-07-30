contract TestGetterBuilder {
    receive() {}

    get fun getBuilder(): Builder {
         return beginCell().storeUint(456, 32);
    }
}
