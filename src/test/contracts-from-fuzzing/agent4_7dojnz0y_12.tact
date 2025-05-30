contract TestLargeString {
    // We'll use ~200 characters below.
    greeting: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque euismod, nisi quis iaculis commodo, massa risus ultricies lorem, a tincidunt libero erat non nunc.";

    receive() {
        dump(self.greeting);
    }
}