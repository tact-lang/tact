contract ReceiverReturn2 {
    receive () {
        if (true) {
            return;
        }
        dump(1);
    }
}
