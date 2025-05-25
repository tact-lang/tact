import { Address, beginCell, toNano } from "@ton/core";
import { internal } from "@ton/sandbox";

import {
    JettonMinter,
    storeJettonBurn,
    storeJettonTransfer,
} from "@/benchmarks/jetton/tact/output/minter_JettonMinter";

import "@ton/test-utils";
import {
    sendMint,
    getTotalSupply,
    getJettonBalance,
    errors,
    sendTransfer,
    sendBurn,
    getRandomInt,
    randomAddress,
    sendDiscovery,
    storeBigPayload,
    type FromInitMinter,
    type FromInitWallet,
    globalSetup,
} from "@/benchmarks/jetton/tests/utils";

export const testWallet = (
    fromInitMinter: FromInitMinter,
    fromInitWallet: FromInitWallet,
) => {
    const setup = async () => {
        return await globalSetup(fromInitMinter, fromInitWallet);
    };

    describe("JettonWallet", () => {
        it("wallet owner should be able to send jettons", async () => {
            const { deployer, jettonMinter, notDeployer, userWallet } =
                await setup();
            const deployerJettonWallet = await userWallet(deployer.address);

            const sentAmount = toNano("0.5");
            await sendMint(
                jettonMinter,
                deployer.getSender(),
                deployer.address,
                sentAmount,
                0n,
                toNano(1),
            );

            const initialJettonBalance =
                await getJettonBalance(deployerJettonWallet);
            const initialTotalSupply = await getTotalSupply(jettonMinter);
            const notDeployerJettonWallet = await userWallet(
                notDeployer.address,
            );
            const initialJettonBalance2 = await getJettonBalance(
                notDeployerJettonWallet,
            );

            const forwardAmount = toNano("0.05");
            const sendResult = await sendTransfer(
                deployerJettonWallet,
                deployer.getSender(),
                toNano("0.1"), // tons
                sentAmount,
                notDeployer.address,
                deployer.address,
                null,
                forwardAmount,
                null,
            );
            expect(sendResult.transactions).toHaveTransaction({
                // excesses
                from: notDeployerJettonWallet.address,
                to: deployer.address,
            });
            expect(sendResult.transactions).toHaveTransaction({
                // notification
                from: notDeployerJettonWallet.address,
                to: notDeployer.address,
                value: forwardAmount,
            });
            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                initialJettonBalance - sentAmount,
            );
            expect(await getJettonBalance(notDeployerJettonWallet)).toEqual(
                initialJettonBalance2 + sentAmount,
            );
            expect(await getTotalSupply(jettonMinter)).toEqual(
                initialTotalSupply,
            );
        });

        it("not wallet owner should not be able to send jettons", async () => {
            const { deployer, jettonMinter, notDeployer, userWallet } =
                await setup();

            const deployerJettonWallet = await userWallet(deployer.address);
            const initialJettonBalance =
                await getJettonBalance(deployerJettonWallet);
            const initialTotalSupply = await getTotalSupply(jettonMinter);
            const notDeployerJettonWallet = await userWallet(
                notDeployer.address,
            );
            const initialJettonBalance2 = await getJettonBalance(
                notDeployerJettonWallet,
            );
            const sentAmount = toNano("0.5");
            const sendResult = await sendTransfer(
                deployerJettonWallet,
                notDeployer.getSender(),
                toNano("0.1"), // tons
                sentAmount,
                notDeployer.address,
                deployer.address,
                null,
                toNano("0.05"),
                null,
            );
            expect(sendResult.transactions).toHaveTransaction({
                from: notDeployer.address,
                to: deployerJettonWallet.address,
                aborted: true,
                exitCode: errors["Incorrect sender jetton"],
            });
            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                initialJettonBalance,
            );
            expect(await getJettonBalance(notDeployerJettonWallet)).toEqual(
                initialJettonBalance2,
            );
            expect(await getTotalSupply(jettonMinter)).toEqual(
                initialTotalSupply,
            );
        });

        it("impossible to send too much jettons", async () => {
            const { deployer, notDeployer, userWallet } = await setup();
            const deployerJettonWallet = await userWallet(deployer.address);
            const initialJettonBalance =
                await getJettonBalance(deployerJettonWallet);
            const notDeployerJettonWallet = await userWallet(
                notDeployer.address,
            );
            const initialJettonBalance2 = await getJettonBalance(
                notDeployerJettonWallet,
            );
            const sentAmount = initialJettonBalance + 1n;
            const forwardAmount = toNano("0.05");
            const sendResult = await sendTransfer(
                deployerJettonWallet,
                deployer.getSender(),
                toNano("0.1"), // tons
                sentAmount,
                notDeployer.address,
                deployer.address,
                null,
                forwardAmount,
                null,
            );
            expect(sendResult.transactions).toHaveTransaction({
                from: deployer.address,
                to: deployerJettonWallet.address,
                aborted: true,
                exitCode: errors["Incorrect balance after send"],
            });
            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                initialJettonBalance,
            );
            expect(await getJettonBalance(notDeployerJettonWallet)).toEqual(
                initialJettonBalance2,
            );
        });

        it("correctly sends forward_payload in place", async () => {
            const { jettonMinter, deployer, notDeployer, userWallet } =
                await setup();

            const sentAmount = toNano("0.5");
            await sendMint(
                jettonMinter,
                deployer.getSender(),
                deployer.address,
                sentAmount,
                0n,
                toNano(1),
            );

            const deployerJettonWallet = await userWallet(deployer.address);
            const initialJettonBalance =
                await getJettonBalance(deployerJettonWallet);
            const notDeployerJettonWallet = await userWallet(
                notDeployer.address,
            );
            const initialJettonBalance2 = await getJettonBalance(
                notDeployerJettonWallet,
            );

            const forwardAmount = toNano("0.05");
            const forwardPayload = beginCell()
                .storeUint(0x123456789n, 128)
                .endCell();
            // This block checks forward_payload in place (Either bit equals 0)
            const sendResult = await sendTransfer(
                deployerJettonWallet,
                deployer.getSender(),
                toNano("0.1"), // tons
                sentAmount,
                notDeployer.address,
                deployer.address,
                null,
                forwardAmount,
                forwardPayload,
            );

            expect(sendResult.transactions).toHaveTransaction({
                // excesses
                from: notDeployerJettonWallet.address,
                to: deployer.address,
            });
            /*
        transfer_notification#7362d09c query_id:uint64 amount:(VarUInteger 16)
                                      sender:MsgAddress forward_payload:(Either Cell ^Cell)
                                      = InternalMsgBody;
        */
            expect(sendResult.transactions).toHaveTransaction({
                // notification
                from: notDeployerJettonWallet.address,
                to: notDeployer.address,
                value: forwardAmount,
                body: beginCell()
                    .storeUint(JettonMinter.opcodes.JettonNotification, 32)
                    .storeUint(0, 64) // default queryId
                    .storeCoins(sentAmount)
                    .storeAddress(deployer.address)
                    .storeSlice(forwardPayload.beginParse()) // Doing this because forward_payload is already Cell with 1 bit 1 and one ref.
                    .endCell(),
            });
            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                initialJettonBalance - sentAmount,
            );
            expect(await getJettonBalance(notDeployerJettonWallet)).toEqual(
                initialJettonBalance2 + sentAmount,
            );
        });

        // There was no such test in official implementation
        it("correctly sends forward_payload in ref", async () => {
            const { jettonMinter, deployer, notDeployer, userWallet } =
                await setup();
            const deployerJettonWallet = await userWallet(deployer.address);

            const sentAmount = toNano("0.5");
            await sendMint(
                jettonMinter,
                deployer.getSender(),
                deployer.address,
                sentAmount,
                0n,
                toNano(1),
            );

            const initialJettonBalance =
                await getJettonBalance(deployerJettonWallet);
            const notDeployerJettonWallet = await userWallet(
                notDeployer.address,
            );
            const initialJettonBalance2 = await getJettonBalance(
                notDeployerJettonWallet,
            );

            const forwardAmount = toNano("0.05");
            // This block checks forward_payload in separate ref (Either bit equals 1)
            const forwardPayload = beginCell()
                .storeUint(1, 1)
                .storeRef(beginCell().storeUint(0x123456789n, 128).endCell())
                .endCell();

            const sendResult = await sendTransfer(
                deployerJettonWallet,
                deployer.getSender(),
                toNano("0.1"), // tons
                sentAmount,
                notDeployer.address,
                deployer.address,
                null,
                forwardAmount,
                forwardPayload,
            );
            expect(sendResult.transactions).toHaveTransaction({
                // excesses
                from: notDeployerJettonWallet.address,
                to: deployer.address,
            });
            /*
        transfer_notification#7362d09c query_id:uint64 amount:(VarUInteger 16)
                                      sender:MsgAddress forward_payload:(Either Cell ^Cell)
                                      = InternalMsgBody;
        */
            expect(sendResult.transactions).toHaveTransaction({
                // notification
                from: notDeployerJettonWallet.address,
                to: notDeployer.address,
                value: forwardAmount,
                body: beginCell()
                    .storeUint(JettonMinter.opcodes.JettonNotification, 32)
                    .storeUint(0, 64) // default queryId
                    .storeCoins(sentAmount)
                    .storeAddress(deployer.address)
                    .storeSlice(forwardPayload.beginParse()) // Doing this because forward_payload is already Cell with 1 bit 1 and one ref.
                    .endCell(),
            });
            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                initialJettonBalance - sentAmount,
            );
            expect(await getJettonBalance(notDeployerJettonWallet)).toEqual(
                initialJettonBalance2 + sentAmount,
            );
        });

        it("no forward_ton_amount - no forward", async () => {
            const { deployer, jettonMinter, notDeployer, userWallet } =
                await setup();
            const deployerJettonWallet = await userWallet(deployer.address);

            const sentAmount = toNano("0.5");
            await sendMint(
                jettonMinter,
                deployer.getSender(),
                deployer.address,
                sentAmount,
                0n,
                toNano(1),
            );

            const initialJettonBalance =
                await getJettonBalance(deployerJettonWallet);
            const notDeployerJettonWallet = await userWallet(
                notDeployer.address,
            );
            const initialJettonBalance2 = await getJettonBalance(
                notDeployerJettonWallet,
            );

            const forwardAmount = 0n;
            const forwardPayload = beginCell()
                .storeUint(0x123456789n, 128)
                .endCell();
            const sendResult = await sendTransfer(
                deployerJettonWallet,
                deployer.getSender(),
                toNano("0.1"), // tons
                sentAmount,
                notDeployer.address,
                deployer.address,
                null,
                forwardAmount,
                forwardPayload,
            );
            expect(sendResult.transactions).toHaveTransaction({
                // excesses
                from: notDeployerJettonWallet.address,
                to: deployer.address,
            });

            expect(sendResult.transactions).not.toHaveTransaction({
                // no notification
                from: notDeployerJettonWallet.address,
                to: notDeployer.address,
            });
            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                initialJettonBalance - sentAmount,
            );
            expect(await getJettonBalance(notDeployerJettonWallet)).toEqual(
                initialJettonBalance2 + sentAmount,
            );
        });

        it("check revert on not enough tons for forward", async () => {
            const { deployer, jettonMinter, notDeployer, userWallet } =
                await setup();
            const deployerJettonWallet = await userWallet(deployer.address);

            const sentAmount = toNano("0.1");

            await sendMint(
                jettonMinter,
                deployer.getSender(),
                deployer.address,
                sentAmount,
                0n,
                toNano(1),
            );

            const initialJettonBalance =
                await getJettonBalance(deployerJettonWallet);
            await deployer.send({
                value: toNano("1"),
                bounce: false,
                to: deployerJettonWallet.address,
            });

            const forwardAmount = toNano("0.3");
            const forwardPayload = beginCell()
                .storeUint(0x123456789n, 128)
                .endCell();
            const sendResult = await sendTransfer(
                deployerJettonWallet,
                deployer.getSender(),
                forwardAmount, // not enough tons, no tons for gas
                sentAmount,
                notDeployer.address,
                deployer.address,
                null,
                forwardAmount,
                forwardPayload,
            );
            expect(sendResult.transactions).toHaveTransaction({
                from: deployer.address,
                on: deployerJettonWallet.address,
                aborted: true,
                exitCode: errors["Insufficient amount of TON attached"],
            });
            // Make sure value bounced
            expect(sendResult.transactions).toHaveTransaction({
                from: deployerJettonWallet.address,
                on: deployer.address,
                inMessageBounced: true,
                success: true,
            });

            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                initialJettonBalance,
            );
        });

        // implementation detail
        it("wallet does not accept internal_transfer not from wallet", async () => {
            const { deployer, notDeployer, userWallet, blockchain } =
                await setup();
            const deployerJettonWallet = await userWallet(deployer.address);
            const initialJettonBalance =
                await getJettonBalance(deployerJettonWallet);
            /*
          internal_transfer  query_id:uint64 amount:(VarUInteger 16) from:MsgAddress
                             response_address:MsgAddress
                             forward_ton_amount:(VarUInteger 16)
                             forward_payload:(Either Cell ^Cell)
                             = InternalMsgBody;
        */
            const internalTransfer = beginCell()
                .storeUint(0x178d4519, 32)
                .storeUint(0, 64) // default queryId
                .storeCoins(toNano("0.01"))
                .storeAddress(deployer.address)
                .storeAddress(deployer.address)
                .storeCoins(toNano("0.05"))
                .storeUint(0, 1)
                .endCell();
            const sendResult = await blockchain.sendMessage(
                internal({
                    from: notDeployer.address,
                    to: deployerJettonWallet.address,
                    body: internalTransfer,
                    value: toNano("0.3"),
                }),
            );
            expect(sendResult.transactions).toHaveTransaction({
                from: notDeployer.address,
                to: deployerJettonWallet.address,
                aborted: true,
                exitCode: errors["Incorrect sender wallet"],
            });
            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                initialJettonBalance,
            );
        });

        it("wallet owner should be able to burn jettons", async () => {
            const { deployer, jettonMinter, userWallet } = await setup();
            const deployerJettonWallet = await userWallet(deployer.address);
            const burnAmount = toNano("0.01");
            await sendMint(
                jettonMinter,
                deployer.getSender(),
                deployer.address,
                burnAmount,
                0n,
                toNano(1),
            );

            const initialJettonBalance =
                await getJettonBalance(deployerJettonWallet);
            const initialTotalSupply = await getTotalSupply(jettonMinter);

            const sendResult = await sendBurn(
                deployerJettonWallet,
                deployer.getSender(),
                toNano("0.1"), // ton amount
                burnAmount,
                deployer.address,
                null,
            ); // amount, response address, custom payload
            expect(sendResult.transactions).toHaveTransaction({
                // burn notification
                from: deployerJettonWallet.address,
                to: jettonMinter.address,
            });
            expect(sendResult.transactions).toHaveTransaction({
                // excesses
                from: jettonMinter.address,
                to: deployer.address,
            });
            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                initialJettonBalance - burnAmount,
            );
            expect(await getTotalSupply(jettonMinter)).toEqual(
                initialTotalSupply - burnAmount,
            );
        });

        it("not wallet owner should not be able to burn jettons", async () => {
            const { deployer, jettonMinter, userWallet, notDeployer } =
                await setup();
            const deployerJettonWallet = await userWallet(deployer.address);
            const initialJettonBalance =
                await getJettonBalance(deployerJettonWallet);
            const initialTotalSupply = await getTotalSupply(jettonMinter);
            const burnAmount = toNano("0.01");
            const sendResult = await sendBurn(
                deployerJettonWallet,
                notDeployer.getSender(),
                toNano("0.1"), // ton amount
                burnAmount,
                deployer.address,
                null,
            ); // amount, response address, custom payload
            expect(sendResult.transactions).toHaveTransaction({
                from: notDeployer.address,
                to: deployerJettonWallet.address,
                aborted: true,
                exitCode: errors["Incorrect sender jetton"],
            });
            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                initialJettonBalance,
            );
            expect(await getTotalSupply(jettonMinter)).toEqual(
                initialTotalSupply,
            );
        });

        it("wallet owner can not burn more jettons than it has", async () => {
            const { deployer, jettonMinter, userWallet } = await setup();
            const deployerJettonWallet = await userWallet(deployer.address);
            const initialJettonBalance =
                await getJettonBalance(deployerJettonWallet);
            const initialTotalSupply = await getTotalSupply(jettonMinter);
            const burnAmount = initialJettonBalance + 1n;
            const sendResult = await sendBurn(
                deployerJettonWallet,
                deployer.getSender(),
                toNano("0.1"), // ton amount
                burnAmount,
                deployer.address,
                null,
            ); // amount, response address, custom payload
            expect(sendResult.transactions).toHaveTransaction({
                from: deployer.address,
                to: deployerJettonWallet.address,
                aborted: true,
                exitCode: errors["Incorrect balance after send"],
            });
            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                initialJettonBalance,
            );
            expect(await getTotalSupply(jettonMinter)).toEqual(
                initialTotalSupply,
            );
        });

        it("minter should only accept burn messages from jetton wallets", async () => {
            const { userWallet, deployer, jettonMinter, blockchain } =
                await setup();
            const deployerJettonWallet = await userWallet(deployer.address);
            const burnAmount = toNano("1");

            await sendMint(
                jettonMinter,
                deployer.getSender(),
                deployer.address,
                burnAmount,
                0n,
                toNano(1),
            );

            const burnNotification = (amount: bigint, addr: Address) => {
                return beginCell()
                    .storeUint(JettonMinter.opcodes.JettonBurnNotification, 32)
                    .storeUint(0, 64)
                    .storeCoins(amount)
                    .storeAddress(addr)
                    .storeAddress(deployer.address)
                    .endCell();
            };

            let res = await blockchain.sendMessage(
                internal({
                    from: deployerJettonWallet.address,
                    to: jettonMinter.address,
                    body: burnNotification(burnAmount, randomAddress(0)),
                    value: toNano("0.1"),
                }),
            );

            expect(res.transactions).toHaveTransaction({
                from: deployerJettonWallet.address,
                to: jettonMinter.address,
                aborted: true,
                exitCode: errors["Unauthorized burn"],
            });

            res = await blockchain.sendMessage(
                internal({
                    from: deployerJettonWallet.address,
                    to: jettonMinter.address,
                    body: burnNotification(burnAmount, deployer.address),
                    value: toNano("0.1"),
                }),
            );

            expect(res.transactions).toHaveTransaction({
                from: deployerJettonWallet.address,
                to: jettonMinter.address,
                success: true,
            });
        });

        // TEP-89
        it("report correct discovery address", async () => {
            const { userWallet, deployer, jettonMinter, notDeployer } =
                await setup();
            let discoveryResult = await sendDiscovery(
                jettonMinter,
                deployer.getSender(),
                deployer.address,
                true,
            );
            /*
          take_wallet_address#d1735400 query_id:uint64 wallet_address:MsgAddress owner_address:(Maybe ^MsgAddress) = InternalMsgBody;
        */
            const deployerJettonWallet = await userWallet(deployer.address);
            expect(discoveryResult.transactions).toHaveTransaction({
                from: jettonMinter.address,
                to: deployer.address,
                body: beginCell()
                    .storeUint(JettonMinter.opcodes.TakeWalletAddress, 32)
                    .storeUint(0, 64)
                    .storeAddress(deployerJettonWallet.address)
                    .storeUint(1, 1)
                    .storeRef(
                        beginCell().storeAddress(deployer.address).endCell(),
                    )
                    .endCell(),
            });

            discoveryResult = await sendDiscovery(
                jettonMinter,
                deployer.getSender(),
                notDeployer.address,
                true,
            );
            const notDeployerJettonWallet = await userWallet(
                notDeployer.address,
            );
            expect(discoveryResult.transactions).toHaveTransaction({
                from: jettonMinter.address,
                to: deployer.address,
                body: beginCell()
                    .storeUint(JettonMinter.opcodes.TakeWalletAddress, 32)
                    .storeUint(0, 64)
                    .storeAddress(notDeployerJettonWallet.address)
                    .storeUint(1, 1)
                    .storeRef(
                        beginCell().storeAddress(notDeployer.address).endCell(),
                    )
                    .endCell(),
            });

            // do not include owner address
            discoveryResult = await sendDiscovery(
                jettonMinter,
                deployer.getSender(),
                notDeployer.address,
                false,
            );
            expect(discoveryResult.transactions).toHaveTransaction({
                from: jettonMinter.address,
                to: deployer.address,
                body: beginCell()
                    .storeUint(JettonMinter.opcodes.TakeWalletAddress, 32)
                    .storeUint(0, 64)
                    .storeAddress(notDeployerJettonWallet.address)
                    .storeUint(0, 1)
                    .endCell(),
            });
        });

        it("Correctly handles not valid address in discovery", async () => {
            const { deployer, jettonMinter } = await setup();
            const badAddr = randomAddress(-1);
            let discoveryResult = await sendDiscovery(
                jettonMinter,
                deployer.getSender(),
                badAddr,
                false,
            );

            expect(discoveryResult.transactions).toHaveTransaction({
                from: jettonMinter.address,
                to: deployer.address,
                body: beginCell()
                    .storeUint(JettonMinter.opcodes.TakeWalletAddress, 32)
                    .storeUint(0, 64)
                    .storeUint(0, 2) // addr_none
                    .storeUint(0, 1)
                    .endCell(),
            });

            // Include address should still be available

            discoveryResult = await sendDiscovery(
                jettonMinter,
                deployer.getSender(),
                badAddr,
                true,
            ); // Include addr

            expect(discoveryResult.transactions).toHaveTransaction({
                from: jettonMinter.address,
                to: deployer.address,
                body: beginCell()
                    .storeUint(JettonMinter.opcodes.TakeWalletAddress, 32)
                    .storeUint(0, 64)
                    .storeUint(0, 2) // addr_none
                    .storeUint(1, 1)
                    .storeRef(beginCell().storeAddress(badAddr).endCell())
                    .endCell(),
            });
        });

        it("Can send even giant payload", async () => {
            const { blockchain, userWallet, deployer, notDeployer } =
                await setup();
            const deployerJettonWallet = await userWallet(deployer.address);
            const jwState = (
                await blockchain.getContract(deployerJettonWallet.address)
            ).account;
            const originalBalance = jwState.account!.storage.balance.coins;

            jwState.account!.storage.balance.coins = 0n;
            await blockchain.setShardAccount(
                deployerJettonWallet.address,
                jwState,
            );

            const maxPayload = beginCell()
                .storeUint(1, 1) // Store Either bit = 1, as we store payload in ref
                .storeRef(storeBigPayload(beginCell()).endCell()) // Here we generate big payload, to cause high forward fee
                .endCell();

            const sendResult = await sendTransfer(
                deployerJettonWallet,
                deployer.getSender(),
                toNano("0.2"), // Quite low amount, enough to cover one forward fee but not enough to cover two
                0n,
                notDeployer.address,
                notDeployer.address,
                null,
                2n, // Forward ton amount, that causes bug, described below
                maxPayload,
            );

            // Here we check, that the transaction should bounce on the first jetton wallet
            // Or it should be fully completed

            // However, as we had incorrect logic of forward fee calculation,
            // https://github.com/tact-lang/jetton/issues/58
            // Jetton version with that bug will not be able to send Jetton Notification
            try {
                // Expect that JettonNotify is sent
                expect(sendResult.transactions).toHaveTransaction({
                    from: (await userWallet(notDeployer.address)).address,
                    to: notDeployer.address,
                    success: true,
                });
            } catch {
                // OR that the transaction is bounced on the first jetton wallet
                expect(sendResult.transactions).toHaveTransaction({
                    on: deployerJettonWallet.address,
                    aborted: true,
                });
            }

            jwState.account!.storage.balance.coins = originalBalance; // restore balance
            await blockchain.setShardAccount(
                deployerJettonWallet.address,
                jwState,
            );
            expect(
                (await blockchain.getContract(deployerJettonWallet.address))
                    .balance,
            ).toEqual(originalBalance);
        });

        // This test consume a lot of time: 18 sec
        // and is needed only for measuring ton accruing
        /* it('jettonWallet can process 250 transfer', async () => {
        const deployerJettonWallet = await userWallet(deployer.address);
        let initialJettonBalance = await deployerJettonWallet.getJettonBalance();
        const notDeployerJettonWallet = await userWallet(notDeployer.address);
        let initialJettonBalance2 = await notDeployerJettonWallet.getJettonBalance();
        let sentAmount = 1n, count = 250n;
        let forwardAmount = toNano('0.05');
        let sendResult: any;
        let payload = beginCell()
                          .storeUint(0x12345678, 32).storeUint(0x87654321, 32)
                          .storeRef(beginCell().storeUint(0x12345678, 32).storeUint(0x87654321, 108).endCell())
                          .storeRef(beginCell().storeUint(0x12345671, 32).storeUint(0x87654321, 240).endCell())
                          .storeRef(beginCell().storeUint(0x12345672, 32).storeUint(0x87654321, 77)
                                               .storeRef(beginCell().endCell())
                                               .storeRef(beginCell().storeUint(0x1245671, 91).storeUint(0x87654321, 32).endCell())
                                               .storeRef(beginCell().storeUint(0x2245671, 180).storeUint(0x87654321, 32).endCell())
                                               .storeRef(beginCell().storeUint(0x8245671, 255).storeUint(0x87654321, 32).endCell())
                                    .endCell())
                      .endCell();
        let initialBalance =(await blockchain.getContract(deployerJettonWallet.address)).balance;
        let initialBalance2 = (await blockchain.getContract(notDeployerJettonWallet.address)).balance;
        for(let i = 0; i < count; i++) {
            sendResult = await deployerJettonWallet.sendTransferMessage(deployer.getSender(), toNano('0.1'), //tons
                   sentAmount, notDeployer.address,
                   deployer.address, null, forwardAmount, payload);
        }
        // last chain was successful
        expect(sendResult.transactions).toHaveTransaction({ //excesses
            from: notDeployerJettonWallet.address,
            to: deployer.address,
        });
        expect(sendResult.transactions).toHaveTransaction({ //notification
            from: notDeployerJettonWallet.address,
            to: notDeployer.address,
            value: forwardAmount
        });

        expect(await deployerJettonWallet.getJettonBalance()).toEqual(initialJettonBalance - sentAmount*count);
        expect(await notDeployerJettonWallet.getJettonBalance()).toEqual(initialJettonBalance2 + sentAmount*count);

        let finalBalance =(await blockchain.getContract(deployerJettonWallet.address)).balance;
        let finalBalance2 = (await blockchain.getContract(notDeployerJettonWallet.address)).balance;

        // if it is not true, it's ok but gas_consumption constant is too high
        // and excesses of TONs will be accrued on wallet
        expect(finalBalance).toBeLessThan(initialBalance + toNano('0.001'));
        expect(finalBalance2).toBeLessThan(initialBalance2 + toNano('0.001'));
        expect(finalBalance).toBeGreaterThan(initialBalance - toNano('0.001'));
        expect(finalBalance2).toBeGreaterThan(initialBalance2 - toNano('0.001'));

    });
    */
        // implementation detail
        it("can not send to masterchain", async () => {
            const { userWallet, deployer } = await setup();

            const deployerJettonWallet = await userWallet(deployer.address);
            const sentAmount = toNano("0.5");
            const forwardAmount = toNano("0.05");
            const sendResult = await sendTransfer(
                deployerJettonWallet,
                deployer.getSender(),
                toNano("0.2"), // tons
                sentAmount,
                Address.parse(
                    "Ef8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAU",
                ),
                deployer.address,
                null,
                forwardAmount,
                null,
            );
            expect(sendResult.transactions).toHaveTransaction({
                // excesses
                from: deployer.address,
                to: deployerJettonWallet.address,
                aborted: true,
                exitCode: errors["Not a basechain address"],
            });
        });
    });
};
export const testBounces = (
    fromInitMinter: FromInitMinter,
    fromInitWallet: FromInitWallet,
) => {
    const setup = async () => {
        return await globalSetup(fromInitMinter, fromInitWallet);
    };
    describe("Bounces", () => {
        it("wallet should restore balance on internal_transfer bounce", async () => {
            const {
                userWallet,
                deployer,
                jettonMinter,
                blockchain,
                notDeployer,
            } = await setup();
            const initRes = await sendMint(
                jettonMinter,
                deployer.getSender(),
                deployer.address,
                201n,
                0n,
                toNano(1),
            );
            const deployerJettonWallet = await userWallet(deployer.address);
            expect(initRes.transactions).toHaveTransaction({
                from: jettonMinter.address,
                to: deployerJettonWallet.address,
                success: true,
            });

            const notDeployerJettonWallet = await userWallet(
                notDeployer.address,
            );
            const balanceBefore = await getJettonBalance(deployerJettonWallet);
            const txAmount = BigInt(getRandomInt(100, 200));
            const transferMsg = beginCell()
                .store(
                    storeJettonTransfer({
                        $$type: "JettonTransfer",
                        queryId: 0n,
                        amount: txAmount,
                        responseDestination: deployer.address,
                        destination: notDeployer.address,
                        customPayload: null,
                        forwardTonAmount: 0n,
                        forwardPayload: beginCell().storeUint(0, 1).asSlice(),
                    }),
                )
                .endCell();

            const walletSmc = await blockchain.getContract(
                deployerJettonWallet.address,
            );

            const res = await walletSmc.receiveMessage(
                internal({
                    from: deployer.address,
                    to: deployerJettonWallet.address,
                    body: transferMsg,
                    value: toNano("1"),
                }),
            );
            expect(res.outMessagesCount).toEqual(1);
            const firstOutMsg = res.outMessages.get(0);
            if (!firstOutMsg) {
                throw new Error("No out message"); // It is impossible due to the check above
            }
            const outMsgSc = firstOutMsg.body.beginParse();
            expect(outMsgSc.preloadUint(32)).toEqual(
                JettonMinter.opcodes.JettonTransferInternal,
            );

            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                balanceBefore - txAmount,
            );

            await walletSmc.receiveMessage(
                internal({
                    from: notDeployerJettonWallet.address,
                    to: walletSmc.address,
                    bounced: true,
                    body: beginCell()
                        .storeUint(0xffffffff, 32)
                        .storeSlice(outMsgSc)
                        .endCell(),
                    value: toNano("0.95"),
                }),
            );

            // Balance should roll back
            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                balanceBefore,
            );
        });
        it("wallet should restore balance on burn_notification bounce", async () => {
            const { userWallet, deployer, jettonMinter, blockchain } =
                await setup();
            // Mint some jettons
            await sendMint(
                jettonMinter,
                deployer.getSender(),
                deployer.address,
                201n,
                0n,
                toNano(1),
            );
            const deployerJettonWallet = await userWallet(deployer.address);
            const balanceBefore = await getJettonBalance(deployerJettonWallet);
            const burnAmount = BigInt(getRandomInt(100, 200));

            const burnMsg = beginCell()
                .store(
                    storeJettonBurn({
                        $$type: "JettonBurn",
                        queryId: 0n,
                        amount: burnAmount,
                        responseDestination: deployer.address,
                        customPayload: null,
                    }),
                )
                .endCell();

            const walletSmc = await blockchain.getContract(
                deployerJettonWallet.address,
            );

            const res = await walletSmc.receiveMessage(
                internal({
                    from: deployer.address,
                    to: deployerJettonWallet.address,
                    body: burnMsg,
                    value: toNano("1"),
                }),
            );

            expect(res.outMessagesCount).toEqual(1);
            const firstOutMsg = res.outMessages.get(0);
            if (!firstOutMsg) {
                throw new Error("No out message"); // It is impossible due to the check above
            }
            const outMsgSc = firstOutMsg.body.beginParse();
            expect(outMsgSc.preloadUint(32)).toEqual(
                JettonMinter.opcodes.JettonBurnNotification,
            );

            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                balanceBefore - burnAmount,
            );

            await walletSmc.receiveMessage(
                internal({
                    from: jettonMinter.address,
                    to: walletSmc.address,
                    bounced: true,
                    body: beginCell()
                        .storeUint(0xffffffff, 32)
                        .storeSlice(outMsgSc)
                        .endCell(),
                    value: toNano("0.95"),
                }),
            );

            // Balance should roll back
            expect(await getJettonBalance(deployerJettonWallet)).toEqual(
                balanceBefore,
            );
        });
    });
};
