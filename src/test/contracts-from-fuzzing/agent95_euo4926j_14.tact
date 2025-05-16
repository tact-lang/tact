contract TestExternal {
    flag: Bool = false;

    external("hello external") {
        // External message receiver: no sender available
        // Expected: sets flag to true if an external message with the comment "hello external" is received
        self.flag = true;
    }
}
