contract TestOptionalsValid {
    receive() {
        let opt: Int? = 100;
        if (opt != null) {
            // Using the force unwrap operator (!!) to get the value
            let unwrapped: Int = opt!!;
            dump(unwrapped);
        }
    }
}
