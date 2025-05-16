contract TestSelfGetter {
    receive () {}

    get fun getSelf(): TestSelfGetter {
         return self;
    }
}
