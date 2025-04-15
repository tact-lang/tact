import { intact } from "@/fmt/test/helpers";

describe("top level declarations comments formatting", () => {
    it(
        "comments in imports",
        intact(`
        // between imports
        import "custom"; /* block import comment */

        fun foo() {}
    `),
    );

    it(
        "comments in primitive type declarations",
        intact(`
        // before primitive
        primitive Int; // inline primitive comment

        /* block primitive comment */
        primitive String;
    `),
    );

    it(
        "comments in function declarations",
        intact(`
        // before function
        fun foo() {} // inline function comment

        /* block function comment */
        fun bar() {} // after function

        fun baz() {}
    `),
    );

    it(
        "comments in asm function declarations",
        intact(`
        // before asm function
        asm fun foo() { ONE } // inline asm comment

        /* block asm comment */
        asm fun bar() { TWO } // after asm function

        asm fun baz() { THREE }
    `),
    );

    it(
        "comments in native function declarations",
        intact(`
        // before native function
        @name("native")
        native foo(); // inline native comment

        /* block native comment */
        @name("native2")
        native bar(); // after native function

        @name("native")
        native bax();
    `),
    );

    it(
        "comments in constant declarations",
        intact(`
        // before constant
        const FOO: Int = 100; // inline constant comment

        /* block constant comment */
        const BAR: Int = 200; // after constant

        const A: Int = 100;
    `),
    );

    it(
        "comments in struct declarations",
        intact(`
        // before struct
        struct Foo {
            /* block field comment */
            age: Int;
        } // inline struct comment

        /* block struct comment */
        struct Bar {
            value: Int;
        } // after struct

        struct Bar {}
    `),
    );

    it(
        "comments in message declarations",
        intact(`
        // before message
        message(0x123) Foo {
            // message field comment
            name: String;
            /* block field comment */
            age: Int;
        } // inline message comment

        /* block message comment */
        message Bar {
            value: Int;
        } // after message

        message Bax {}
    `),
    );

    it(
        "comments in contract declarations",
        intact(`
        // before contract
        contract Foo(param: Int) {
            // contract field comment
            field: Int;

            /* block field comment */
            const FOO: Int = 100;
        } // inline contract comment

        /* block contract comment */
        contract Bar {
            value: Int;
        } // after contract

        contract Bax {}
    `),
    );

    it(
        "comments in trait declarations",
        intact(`
        // before trait
        trait Foo {
            // trait field comment
            field: Int;

            /* block field comment */
            const FOO: Int = 100;
        } // inline trait comment

        /* block trait comment */
        trait Bar {
            value: Int;
        } // after trait

        trait Bax {}
    `),
    );

    it(
        "comments in contract with inheritance",
        intact(`
        // before contract with inheritance
        contract Foo(param: Int) with Bar, Baz {
            // contract content
            field: Int;
        } // inline inheritance comment

        /* block inheritance comment */
        contract Bar with Foo {
            value: Int;
        }
    `),
    );

    it(
        "comments in contract with interface",
        intact(`
        // before contract with interface
        @interface("api")
        contract Foo {
            // contract content
            field: Int;
        } // inline interface comment

        /* block interface comment */
        @interface("api2")
        contract Bar {
            value: Int;
        }
    `),
    );

    it(
        "comments in contract with init",
        intact(`
        // before contract with init
        contract Foo {
            // init comment
            init(param: Int) {
                // init body comment
                field = param;
            }
        } // inline init comment

        /* block init comment */
        contract Bar {
            init(value: Int) {
                field = value;
            }
        }
    `),
    );

    it(
        "comments in contract with receive",
        intact(`
        // before contract with receive
        contract Foo {
            // receive comment
            receive(msg: Message) {
                // receive body comment
                process(msg);
            }
        } // inline receive comment

        /* block receive comment */
        contract Bar {
            receive(msg: Message) {
                handle(msg);
            }
        }
    `),
    );

    it(
        "comments in contract with external",
        intact(`
        // before contract with external
        contract Foo {
            // external comment
            external(msg: Message) {
                // external body comment
                process(msg);
            }
        } // inline external comment

        /* block external comment */
        contract Bar {
            external(msg: Message) {
                handle(msg);
            }
        }
    `),
    );

    it(
        "comments in contract with bounced",
        intact(`
        // before contract with bounced
        contract Foo {
            // bounced comment
            bounced(msg: Message) {
                // bounced body comment
                process(msg);
            }
        } // inline bounced comment

        /* block bounced comment */
        contract Bar {
            bounced(msg: Message) {
                handle(msg);
            }
        }
    `),
    );

    it(
        "comments in contract with get function",
        intact(`
        // before contract with get
        contract Foo {
            // get function comment
            get fun value(): Int {
                // get body comment
                return field;
            }
        } // inline get comment

        /* block get comment */
        contract Bar {
            get fun value(): Int {
                return field;
            }
        }
    `),
    );

    it(
        "comments in contract with multiple items",
        intact(`
        // before contract with multiple items
        contract Foo {
            // field comment
            field: Int;

            // init comment
            init(value: Int) {
                field = value;
            }

            // receive comment
            receive(msg: Message) {
                process(msg);
            }

            // get comment
            get fun value(): Int {
                return field;
            }
        } // inline multiple items comment

        /* block multiple items comment */
        contract Bar {
            field: Int;

            init(value: Int) {
                field = value;
            }

            receive(msg: Message) {
                process(msg);
            }

            get fun value(): Int {
                return field;
            }
        }
    `),
    );
});
