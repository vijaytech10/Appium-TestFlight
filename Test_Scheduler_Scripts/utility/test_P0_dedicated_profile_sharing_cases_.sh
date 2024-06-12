test_P0_dedicated_profile_sharing_cases_receiver_01.py:TEST_ACCOUNT_SHARING_US_001:IOS ===> NA
brazil-test-exec py.test test/sharing_tests/test_P0_dedicated_profile_sharing_cases_receiver_01.py --test-account-keys=TEST_ACCOUNT_SHARING_US_001 --device-keys=IOS -s -v --html=build/brazil-sharing/report.html --simulator

test_BAT_sharing_sender_test_cases_01.py:TEST_ACCOUNT_SHARING_US_001:IOS ===> spfm_2704
brazil-test-exec py.test test/sharing_tests/test_BAT_sharing_sender_test_cases_01.py --test-account-keys=TEST_ACCOUNT_SHARING_US_001 --device-keys=IOS -s -v --html=build/brazil-sharing/report.html --simulator

test_BAT_sharing_receiver_test_cases_01.py:TEST_ACCOUNT_SHARING_US_004:IOS ===> spfm_2704
brazil-test-exec py.test test/sharing_tests/test_BAT_sharing_receiver_test_cases_01.py --test-account-keys=TEST_ACCOUNT_SHARING_US_004 --device-keys=IOS -s -v --html=build/brazil-sharing/report.html --simulator

test_BAT_sharing_sender_test_cases_02.py:TEST_ACCOUNT_SHARING_US_001:IOS ===> SPFM-2694 , spfm_2689
brazil-test-exec py.test test/sharing_tests/test_BAT_sharing_sender_test_cases_02.py --test-account-keys=TEST_ACCOUNT_SHARING_US_001 --device-keys=IOS -s -v --html=build/brazil-sharing/report.html --simulator

test_BAT_sharing_receiver_test_cases_02.py:TEST_ACCOUNT_SHARING_US_002:IOS ===> SPFM-2694 , spfm_2689

test_BVT_sharing_sender_test_cases_01.py:TEST_ACCOUNT_SHARING_US_005:IOS ===> spfm_2678
brazil-test-exec py.test test/sharing_tests/test_BVT_sharing_sender_test_cases_01.py --test-account-keys=TEST_ACCOUNT_SHARING_US_005 --device-keys=IOS -s -v --html=build/brazil-sharing/report.html --simulator

test_P0_QnA_sharing_sender_test_cases_01.py:TEST_ACCOUNT_SHARING_US_003:IOS ===> NA
brazil-test-exec py.test test/sharing_tests/test_P0_QnA_sharing_sender_test_cases_01.py --test-account-keys=TEST_ACCOUNT_SHARING_US_003 --device-keys=IOS -s -v --html=build/brazil-sharing/report.html --simulator

test_P0_QnA_sharing_receiver_test_cases_01.py:TEST_ACCOUNT_SHARING_US_002:IOS ===> NA

test_P0_link_sharing_sender_test_cases_01.py:TEST_ACCOUNT_SHARING_US_004:IOS ===> spfm_2710 , spfm_2822 , spfm_2810
brazil-test-exec py.test test/sharing_tests/test_P0_link_sharing_sender_test_cases_01.py --test-account-keys=TEST_ACCOUNT_SHARING_US_004 --device-keys=IOS -s -v --html=build/brazil-sharing/report.html --simulator

test_P0_link_sharing_receiver_test_cases_01.py:TEST_ACCOUNT_SHARING_US_003:IOS ===> spfm_2710 , spfm_2822 , spfm_2810

test_BVT_sharing_receiver_test_cases_01.py:TEST_ACCOUNT_SHARING_US_007:IOS ===> spfm_2678

test_P0_shared_with_you_tab_sender_test_cases_01.py:TEST_ACCOUNT_SHARING_US_005:IOS ===> NA
brazil-test-exec py.test test/sharing_tests/test_P0_shared_with_you_tab_sender_test_cases_01.py --test-account-keys=TEST_ACCOUNT_SHARING_US_005 --device-keys=IOS -s -v --html=build/brazil-sharing/report.html --simulator

test_P0_shared_with_you_tab_receiver_test_cases_01.py:TEST_ACCOUNT_SHARING_US_008:IOS ===> NA

test_P0_shared_with_you_tab_sender_test_cases_02.py:TEST_ACCOUNT_SHARING_US_006:IOS ===> NA
brazil-test-exec py.test test/sharing_tests/test_P0_shared_with_you_tab_sender_test_cases_02.py --test-account-keys=TEST_ACCOUNT_SHARING_US_006 --device-keys=IOS -s -v --html=build/brazil-sharing/report.html --simulator

test_P0_shared_with_you_tab_receiver_test_cases_02.py:TEST_ACCOUNT_SHARING_US_005:IOS ===> NA






brazil-test-exec py.test test/sharing_tests/"$test_file" --test-account-keys="$test_account_keys" --device-keys="$device_keys" -s -v --html="$HTML_REPORT_PATH"

brazil-test-exec py.test test/sharing_tests/test_BAT_sharing_sender_test_cases_02.py --test-account-keys=TEST_ACCOUNT_SHARING_US_001 --device-keys=IOS -s -v --html=build/brazil-sharing/report.html --server-logs=build/brazil-sharing --self-contained-html --simulator

brazil-test-exec py.test test/sharing_tests/test_BAT_sharing_sender_test_cases_02.py --test-account-keys=TEST_ACCOUNT_SHARING_US_001 --device-keys=IOS -s -v --html=build/brazil-sharing/report.html --simulator