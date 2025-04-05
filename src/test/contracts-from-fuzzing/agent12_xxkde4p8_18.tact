struct NodeAdjusted {
    value: Int;
    next: Cell?; // Use a Cell to hold further linked NodeAdjusted serialization.
}

contract TestLinkedListAdjusted {
    receive() {
        // Instantiate a NodeAdjusted with no next element.
        let head: NodeAdjusted = NodeAdjusted { value: 10, next: null };
        dump(head.value);
    }
}
