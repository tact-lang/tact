contract TestSha256LargeString {
    receive() {
        let hash: Int = sha256("This is a string that is definitely longer than 127 bytes. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lacinia fringilla vulputate. Mauris vehicula orci diam, eget porttitor elit dapibus eu. Proin ut.");
        dump(hash);
    }
}