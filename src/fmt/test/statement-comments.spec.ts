import { test, intact } from "@/fmt/test/helpers";

describe("statement comments formatting", () => {
    it(
        "multiple statements with inline comments",
        intact(`
        fun foo() {
            let x = 10; // first comment
            x = 20; // second comment
            return x; // return comment
        }
    `),
    );

    it(
        "statements with block comments",
        intact(`
        fun foo() {
            /* start block */
            let x = 10;
            /* middle block */
            x = 20;
            /* end block */
            return x;
        }
    `),
    );

    it(
        "statements with mixed comments and newlines",
        intact(`
        fun foo() {
            let x = 10; // inline 1

            /* block 1 */
            x = 20;

            // line 1
            // line 2
            return x; // inline 2
        }
    `),
    );

    it(
        "statements with comments before and after",
        intact(`
        fun foo() {
            // before let
            let x = 10;
            // before assign
            x = 20;
            // before return
            return x;
            // after return
        }
    `),
    );

    it(
        "statements with complex comment patterns",
        intact(`
        fun foo() {
            /* start */
            let x = 10; // inline 1
            /* middle */
            x = 20; // inline 2
            /* end */
            return x; // final
        }
    `),
    );

    it(
        "statements with comments between expressions",
        intact(`
        fun foo() {
            let x = 10;
            // between
            let y = 20;
            // between
            return x + y;
        }
    `),
    );

    it(
        "statements with comments in different positions",
        intact(`
        fun foo() {
            // top
            let x = 10;
            x = 20; // middle
            /* bottom */
            return x;
        }
    `),
    );

    it(
        "comments in control flow statements",
        intact(`
        fun foo() {
            // check if value is valid
            if (value > 0) {
                // process positive value
                result = value * 2;
            } else {
                // handle negative value
                result = 0;
            }

            // iterate over items
            while (i < items.length) {
                // process each item
                process(items);
                i = i + 1;
            }
        }
    `),
    );

    it(
        "comments in error handling",
        intact(`
        fun foo() {
            try {
                // attempt to load data
                loadData();
            } catch (error) {
                // handle loading error
                logError(error);
            }

            // validate result
            if (!isValid(result)) {
                // throw if invalid
                throw("Invalid result");
            }
        }
    `),
    );

    it(
        "comments in data processing",
        intact(`
        fun foo() {
            // initialize counters
            let total = 0;
            let count = 0;

            // process each item
            foreach (key, value in items) {
                // skip invalid items
                if (!isValid(value)) {
                    continue;
                }

                // update statistics
                total = total + value;
                count = count + 1;
            }

            // calculate average
            return count > 0 ? total / count : 0;
        }
    `),
    );

    it(
        "comments in complex expressions",
        intact(`
        fun foo() {
            // calculate complex result
            let result = (a + b) * c; // first part
            result = result + (d * e); // second part

            // apply final transformation
            return result > 100 ? result / 2 : result * 2; // normalize value
        }
    `),
    );

    it(
        "comments in function parameters",
        intact(`
        fun foo(
            // input value to process
            value: Int,
            // optional threshold
            threshold: Int?,
            // flag to enable debug mode
            debug: Bool,
        ) {
            // validate input
            if (value < 0) {
                throw("Value must be positive");
            }

            // process value
            return process(value, threshold, debug);
        }
    `),
    );

    it(
        "floating comments between statements",
        intact(`
        fun foo() {
            let x = 10;
            x = 20;

            // This is a floating comment
            // It's not attached to any statement
            // It can have multiple lines

            let y = 30;
            y = 40;

            /* Another floating comment
               This time it's a block comment
               With multiple lines */

            return x + y;
        }
    `),
    );

    it(
        "mixed floating and attached comments",
        intact(`
        fun foo() {
            let x = 10; // attached comment

            // floating comment 1
            // floating comment 2

            x = 20; /* attached block comment */

            /* floating block comment
               with multiple lines */

            let y = 30; // attached comment

            // floating comment 3
            // floating comment 4

            return x + y; // attached comment
        }
    `),
    );

    it(
        "floating comments with empty lines",
        intact(`
        fun foo() {
            let x = 10;
            x = 20;

            // floating comment 1

            // floating comment 2

            let y = 30;

            /* floating block comment */

            y = 40;

            return x + y;
        }
    `),
    );

    it(
        "floating comments in complex blocks",
        intact(`
        fun foo() {
            if (condition) {
                let x = 10;
                x = 20;

                // floating comment in if block
                // with multiple lines

                let y = 30;
            } else {
                // floating comment in else block
                let z = 40;
            }

            // floating comment after if-else

            while (condition) {
                // floating comment in while block

                process();
            }

            return result;
        }
    `),
    );

    it(
        "comments after opening brace",
        intact(`
        fun foo() { // comment after opening brace
            let x = 10;
            return x;
        }
    `),
    );

    it(
        "multiple comments after opening brace",
        intact(`
        fun foo() { // first comment
            // second comment
            let x = 10;
            return x;
        }
    `),
    );

    it(
        "comments between statements without newlines",
        intact(`
        fun foo() {
            let x = 10; // first
            x = 20; // second
            return x; // third
        }
    `),
    );

    it(
        "comments in single line statements",
        intact(`
        fun foo() {
            let x = 10; // inline comment
            return x; // return comment
        }
    `),
    );

    it(
        "comments in complex single line statements",
        intact(`
        fun foo() {
            if (true) { return 10 } // comment after if
            return 20; // comment after return
        }
    `),
    );

    it(
        "comments in nested blocks",
        intact(`
        fun foo() {
            if (true) {
                // comment in if block
                let x = 10;
                if (x > 0) {
                    // comment in nested if
                    return x;
                }
            }
            return 0;
        }
    `),
    );

    it(
        "comments in try-catch blocks",
        intact(`
        fun foo() {
            try {
                // comment in try
                loadData();
            } catch (error) {
                // comment in catch
                handleError(error);
            }
        }
    `),
    );

    it(
        "comments in foreach blocks",
        intact(`
        fun foo() {
            foreach (key, value in items) {
                // comment in foreach
                process(value);
            }
        }
    `),
    );

    it(
        "comments in while blocks",
        intact(`
        fun foo() {
            while (condition) {
                // comment in while
                process();
            }
        }
    `),
    );

    it(
        "comments in until blocks",
        intact(`
        fun foo() {
            do {
                // comment in do
                process();
            } until (condition); // comment after until
        }
    `),
    );

    it(
        "comments in repeat blocks",
        intact(`
        fun foo() {
            repeat (condition) {
                // comment in repeat
                process();
            }
        }
    `),
    );

    it(
        "comments in destruct statements",
        intact(`
        fun foo() {
            let Foo { name, age } = value; // comment after destruct
        }
    `),
    );

    it(
        "comments in return statements with expressions",
        intact(`
        fun foo() {
            return 10; // simple return
            return (a + b) * c; // complex return
            return Foo { name: "test" }; // struct return
        }
    `),
    );

    it(
        "comments in assign statements",
        intact(`
        fun foo() {
            x = 10; // simple assign
            x += 20; // augmented assign
            x = (a + b) * c; // complex assign
        }
    `),
    );

    it(
        "comments in expression statements",
        intact(`
        fun foo() {
            process(); // function call
            x + y; // binary operation
            Foo { name: "test" }; // struct instance
        }
    `),
    );

    it(
        "comments in block statements",
        intact(`
        fun foo() {
            {
                // comment in block
                let x = 10;
            }
        }
    `),
    );

    it(
        "comments in if-else chains",
        intact(`
        fun foo() {
            if (a) {
                // first if
                return 1;
            } else if (b) {
                // else if
                return 2;
            } else {
                // else
                return 3;
            }
        }
    `),
    );

    it(
        "comments in complex nested structures",
        intact(`
        fun foo() {
            if (condition) {
                // outer if
                while (loop) {
                    // inner while
                    try {
                        // inner try
                        process();
                    } catch (e) {
                        // inner catch
                        handle(e);
                    }
                }
            }
        }
    `),
    );

    it(
        "comments with multiple newlines",
        test(
            `
        fun foo() {
            let x = 10;


            // comment with newlines


            return x;
        }
    `,
            `
        fun foo() {
            let x = 10;

            // comment with newlines

            return x;
        }
    `,
        ),
    );

    it(
        "comments in empty blocks",
        intact(`
        fun foo() {
            // comment in empty block
        }
    `),
    );

    it(
        "comments in blocks with only comments",
        intact(`
        fun foo() {
            // first comment
            // second comment
            /* block comment */
        }
    `),
    );

    it(
        "comments in multiline field access",
        intact(`
            fun foo() {
                10
                    // comment here prevents the formatter from working
                    .foo;
            }
        `),
    );

    it(
        "comments in multiline method call",
        intact(`
            fun foo() {
                10
                    // comment here prevents the formatter from working
                    .foo();
            }
        `),
    );

    it(
        "comments in multiline method call with struct instance",
        intact(`
            fun foo() {
                Foo {}
                // comment here prevents the formatter from working
                    .foo();
            }
        `),
    );

    it(
        "comments in single line method call",
        intact(`
            fun foo() {
                let _ = SomeMessage {} /* hello */.foo();
            }
        `),
    );
});
