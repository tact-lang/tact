// optional chain in init param contract (empty param list disables init params)
contract EmptyParams() {
    receive() {
        let _ = 1;
    }
}