" Vim syntax file
" Language:	Stan (http://mc-stan.org)
" Maintainer:	J. Guo <guojq28@gmail.com> 
" Last Change:  Feb 18 2015
" Filenames:	*.stan
" URL:		

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version >= 600
  setlocal iskeyword=@,48-57,_,.
else
  set iskeyword=@,48-57,_,.
endif

syn case match

syntax match stanCommentError display "\*/" 
syntax match stanCommentStartError display "/\*"me=e-1 contained 

syn keyword	stanTodo	TODO FIXME TBD contained 
syn cluster	stanCommentGroup	contains=stanTodo

" Comment
" copied from c.vim, not exactly know what is going on
syn region stanCommentL start="//" skip="\\$" end="$" keepend contains=@stanCommentGroup,@Spell 
syn match  stanCommentL /\#.*/ 
" syn region stanComment start="/\*" end="\*/" contains=stanTodo 
syn region stanComment start="/\*" end="\*/" contains=@stanCommentGroup,@stanCommentError,@Spell extend 

" Constant
" string enclosed in double quotes
syn region stanString start=/"/ skip=/\\\\\|\\"/ end=/"/
" string enclosed in single quotes
syn region stanString start=/'/ skip=/\\\\\|\\'/ end=/'/
" number with no fractional part or exponent
syn match stanNumber /\d\+/
" floating point number with integer and fractional parts and optional exponent
syn match stanFloat /\d\+\.\d*\([Ee][-+]\=\d\+\)\=/
" floating point number with no integer part and optional exponent
syn match stanFloat /\.\d\+\([Ee][-+]\=\d\+\)\=/
" floating point number with no fractional part and optional exponent
syn match stanFloat /\d\+[Ee][-+]\=\d\+/

" Identifier
" identifier with leading letter and optional following keyword characters
syn match stanIdentifier /\a\k*/
" identifier with leading period, one or more digits, and at least one non-digit keyword character
syn match stanIdentifier /\.\d*\K\k*/

" Statement
" syn keyword stanStatement   break next return
syn keyword stanConditional if else
syn keyword stanRepeat      for in while

" Constant
" syn keyword stanConstant LETTERS letters month.ab month.name pi
" syn keyword stanConstant NULL
" syn keyword stanBoolean  FALSE TRUE
" syn keyword stanNumber   NA
syn match stanArrow /<\{1}-/
syn match stanDistributed /\~/ 

" Type
" syn keyword stanType data model  array category character complex real function integer list logical matrix numeric vector data.frame 
" syn keyword stanType var 

syn keyword stanType  int real cov_matrix corr_matrix vector matrix simplex
syn keyword stanBlk functions data model parameters transformed generated quantities 
" syn keyword stanBlk derived
syn match equalSign /=/
syn keyword stanLU lower upper nextgroup=equalSign skipwhite

syn match leftParen /(/
syn keyword stanDistributions normal uniform multi_normal inv_gamma 
syn keyword stanDistributions normal_log uniform_log multi_normal_log inv_gamma_log 
syn keyword stanDistributions categorical categorical_log  
syn keyword stanDistributions normal_trunc_l normal_trunc_h  normal_trunc_lh exponential inv_chi_square student cauchy  
syn keyword stanDistributions normal_trunc_l_log normal_trunc_h_log  normal_trunc_lh_log exponential_log inv_chi_square_log student_log cauchy_log  
syn keyword stanDistributions double_exponential weibull logistic lognormal dirichlet skew_normal
syn keyword stanDistributions double_exponential_log weibull_log logistic_log lognormal_log dirichlet_log 
syn keyword stanDistributions bernoulli binomial neg_binomial beta_binomial poisson 
syn keyword stanDistributions bernoulli_log binomial_log neg_binomial_log beta_binomial_log poisson_log 
syn keyword stanDistributions bernoulli_logit bernoulli_logit_log 
syn keyword stanDistributions wishart inv_wishart 
syn keyword stanDistributions wishart_log inv_wishart_log  exp_mod_normal frechet scaled_inv_chi_square

syn keyword stanDistributions normal_cdf_log exponential_cdf_log  weibull_cdf_log gamma_cdf_log 
syn keyword stanDistributions normal_ccdf_log exponential_ccdf_log  weibull_ccdf_log gamma_ccdf_log 
" only highight gamma beta such that there is '(' after
" that indicating it is distribution.
" For the time being, not define others. `normal` should 
" not be a name used. 
syn match stanDistributionsII  /gamma\(\s*(\)\@=/
syn match stanDistributionsII  /beta\(\s*(\)\@=/


syn keyword stanFunctions exp sum log pow mean abs inv_logit  determinant  fabs pi 
syn keyword stanFunctions col row sd 
syn keyword stanFunctions int_step inv_cloglog inverse lbeta lgamma lmgamma log log10 log1m log1m_inv_logit log1p logp1p_exp log2 log_determinant log_inv_logit log_sum_exp logit max mdivide_left_tri_low midivide_right_tri_low mean min multiply_Log multiply_lower_tri_self_transpose negative_epsilon negative_infinity not_a_number pi positive_infinity pow prod round row rows sd sin singuar_values sinh size softmax sqrt sqrt2 square step sum tan tanh
syn keyword stanFunctions binary_log_loss binomial_coefficient_log  atan2 atan asin asinh atanh block cbrt ceil cholesy_decompose col cols cos cosh crossprod cumulative_sum diag_matrix diag_post_multiply diag_pre_multiply diagnoal dims dot_product dot_self e eigenvalues_sym eigenvectors_sym epsilon erf erfc exp exp2 expm1 fdim floor fma fmax fmin fmod hypot if_else 
syn keyword stanFunctions bernoulli_cdf beta_binomial_cdf beta_cdf binomial_cdf exponential_cdf inv_chi_square_cdf inv_gamma_cdf logistic_cdf lognormal_cdf neg_binomial_cdf normal_cdf pareto_cdf poisson_cdf scaled_inv_chi_square_cdf student_t_cdf
syn keyword stanFunctions bernoulli_ccdf beta_binomial_ccdf beta_ccdf binomial_ccdf exponential_ccdf inv_chi_square_ccdf inv_gamma_ccdf logistic_ccdf lognormal_ccdf neg_binomial_ccdf normal_ccdf pareto_ccdf poisson_ccdf scaled_inv_chi_square_ccdf student_t_ccdf rows_dot_self rows_dot_product 
syn keyword stanFunctions increment_log_prob falling_factorial rising_factorial frechet_rng frechet_log frechet_cdf frechet_cdf_log frechet_ccdf_log get_lp gumbel_rng gumbel_cdf_log gumbel_ccdf_log head tail hypergeometric_rng hypergeometric_log  sub_col sub_row squared_distance  sort_indices_asc sort_indices_desc sort_asc sort_desc skew_normal_rng skew_normal_log skew_normal_cdf_log skew_normal_ccdf_log
syn keyword stanFunctions double_exponential_cdf  double_exponential_cdf_log double_exponential_ccdf_log double_exponential_rng segment scaled_inv_chi_square_ccdf scaled_inv_chi_square_cdf_log scaled_inv_chi_square_ccdf_log scaled_inv_chi_square_rng 
syn keyword stanFunctions exp_mod_normal_rng  exp_mod_normal_log exp_mod_normal_cdf exp_mod_normal_ccdf exp_mod_normal_ccdf_log log_diff_exp log_mix modified_bessel_first_kind modified_bessel_second_kind multi_gp_log multi_gp_cholesky_log log_softmax log_rising_factorial  log_falling_factorial tcrossprod 
syn keyword stanDistributions multi_gp_cholesky multi_gp rayleigh von_mises
syn keyword stanFunctions bernoulli_rng beta_binomial_rng beta_rng binomial_rng exponential_rng inv_chi_square_rng inv_gamma_rng logistic_rng lognormal_rng neg_binomial_rng normal_rng pareto_rng poisson_rng scaled_inv_chi_square_rng student_t_rng rep_array rep_matrix von_mises_rng von_mises_log trace_gen_quad_form trace_quad_form trace to_array_1d to_vector to_array_2d to_matrix 
syn keyword stanFunctions eigenvectors_sym eigenvectors_sym inverse_spd inv_sqrt num_elements qr_Q qr_R quad_form quad_form_sym quad_form_diag rank  rayleigh_rng rayleigh_log rayleigh_cdf rayleigh_cdf_log rayleigh_ccdf_log
" step function in stan
" defined as step(y) = y < 0 ? 0 : 1
syn keyword stanFunctions step append_row append_col 
" normal CDF 
syn keyword stanFunctions Phi  Phi_approx 

" Special
syn match stanDelimiter /[,;:><]/

" Error
syn region stanRegion matchgroup=Delimiter start=/(/ matchgroup=Delimiter end=/)/ transparent contains=ALLBUT,stanError,stanBraceError,stanCurlyError
syn region stanRegion matchgroup=Delimiter start=/{/ matchgroup=Delimiter end=/}/ transparent contains=ALLBUT,stanError,stanBraceError,stanParenError
syn region stanRegion matchgroup=Delimiter start=/\[/ matchgroup=Delimiter end=/]/ transparent contains=ALLBUT,stanError,stanCurlyError,stanParenError
syn match stanError      /[)\]}]/
syn match stanBraceError /[)}]/ contained
syn match stanCurlyError /[)\]]/ contained
syn match stanParenError /[\]}]/ contained
syn match stanDAError  /<\{2,}-/
syn match stanEqError  /\(lower\s*\|upper\s*\|>\|<\)\@<!=/
syn match stanCmp      /==/
syn match stanCmp      /!=/
syn match stanCmp      />=/
syn match stanCmp      /<=/
syn match stanCmp      />/
syn match stanCmp      /</
" transpose 
syn match stanCmp      /'/

syntax keyword stanCppConflict  alignas alignof and and_eq asm auto bitand bitor bool break case catch char
syntax keyword stanCppConflict  char16_t char32_t class compl const constexpr const_cast continue decltype
syntax keyword stanCppConflict  default delete do double dynamic_cast enum explicit export extern false
syntax keyword stanCppConflict  float friend goto inline long mutable namespace new noexcept not not_eq
syntax keyword stanCppConflict  nullptr operator or or_eq private protected public register reinterpret_cast
syntax keyword stanCppConflict  short signed sizeof static static_assert static_cast struct switch
syntax keyword stanCppConflict  template this thread_local throw true try typedef typeid typename union
syntax keyword stanCppConflict  unsigned using virtual volatile wchar_t xor xor_eq

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_r_syn_inits")
  if version < 508
    let did_r_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  " copied from sas.vim 
  hi sComment term=bold cterm=NONE ctermfg=Blue  ctermbg=Black gui=NONE guifg=DarkGreen guibg=White 

  HiLink stanComment     Comment
  HiLink stanCommentL    Comment
  HiLink stanConstant    Constant
  HiLink stanString      String
  HiLink stanNumber      Number
  HiLink stanBoolean     Boolean
  HiLink stanFloat       Float
  HiLink stanStatement   Statement
  HiLink stanConditional Conditional
  HiLink stanRepeat      Repeat
  HiLink stanIdentifier  Normal
  HiLink stanArrow	 Statement	
  HiLink stanDistributed Statement 
  HiLink stanType        Type
  HiLink stanFunctions   Function 
  HiLink stanDistributions Type 
  HiLink stanDistributionsII Type 
  HiLink stanDelimiter   Delimiter
  HiLink stanError       Error
  HiLink stanBraceError  Error
  HiLink stanCurlyError  Error
  HiLink stanParenError  Error
  HiLink stanEqError     Error
  HiLink stanDaError     Error
  HiLink stanCppConflict Error
  HiLink stanBlk         Special 
  HiLink stanLU          Special 
  HiLink stanCmp         Operator
  delcommand HiLink
endif

let b:current_syntax="stan"

" vim: ts=8 sw=2
" If more fancy colors (or modes) are needed, see sas.vim 
" for examples. 
