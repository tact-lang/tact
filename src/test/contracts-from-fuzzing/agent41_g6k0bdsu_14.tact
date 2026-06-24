contract TestComparisons {
    receive() {
        // Equality and relational comparisons
        let eq: Bool = (1 == 1);
        let neq: Bool = (1 != 2);
        let gt: Bool = (5 > 4);
        let lt: Bool = (3 < 4);
        let ge: Bool = (5 >= 5);
        let le: Bool = (3 <= 4);

        dump(eq);
        dump(neq);
        dump(gt);
        dump(lt);
        dump(ge);
        dump(le);
    }
}
